local bn = require "bn"

myseed = 100 
bias = 0.9

TEST = false

VMAX = 5
N = 1000

N_IN = 24
N_OUT = 2
PROX_THRESHOLD = 0.2

F = {}
I = {}
best_F = {}
best_I = {}
state = {}
seed = 0

nsteps = 0
CHECK_STEPS = 1200

in_mapping = {}
out_mapping = {}
best_in_mapping = {}
best_out_mapping = {}


n_in = 0
n_out = 0

efv = 0
old_efv = 0
best_efv = 0
DELTA_THRESHOLD = 0


function sigma(x)
  if x > 0.9 then
    x = 1
  end
  return x
end



-- evaluation function à la ER
function eval_function()
  idx = 1
  pmax = sigma(robot.proximity[1].value)
  for i = 2,24 do
    proxvalue = sigma(robot.proximity[i].value)
    if pmax < proxvalue then
      pmax = proxvalue
      idx = i
    end
  end

  if vl > 0 then
    bvl = 1
  else
    bvl = 0
  end
  if vr > 0 then
    bvr = 1
  else
    bvr = 0
  end
  
--   ef = (1-pmax) * (1-math.sqrt(math.abs(bvl-bvr))) * (bvl+bvr)/2
  ef = (1-pmax) * (1-math.sqrt(math.abs(bvl-bvr))) * (bvl+bvr)/2
  
  return ef/CHECK_STEPS
end



-- change mapping: both inputs and outputs are changed. NOTE: inputs cannot coincide with outputs
function change_mapping_ALL()
  v = {}
  for i = 1,N do
    v[i] = i
  end
  v = bn.shuffle(v)
  
  -- set inputs
  for i = 1,n_in do
    in_mapping[i] = v[i]
  end
  -- set outputs
  for i = 1,n_out do
    in_mapping[i] = v[i + n_in]
  end
end



-- change mapping: only inputs are changed.
function change_mapping_INPUTS()
  v = {}
  for i = 1,N do
    v[i] = i
  end
  v = bn.shuffle(v)
  
  -- set inputs
  for i = 1,n_in do
    in_mapping[i] = v[i]
  end
end




-- change mapping: only outputs are changed.
function change_mapping_OUTPUTS()
  v = {}
  for i = 1,N do
    v[i] = i
  end
  v = bn.shuffle(v)
  
  -- set outputs
  for i = 1,n_out do
    in_mapping[i] = v[i]
  end
end





-- change mapping: swap one in/out
function change_mapping_SWAP(v)
  i = math.random(1,#v)
  v[i] = math.random(1,N)
end



-- change mapping: flip one entry in F
function change_mapping_flipF()
  i = math.random(1,N)
  j = math.random(1,#F[i])
  F[i][j] = 1 - F[i][j]
end




-- change mapping. NOTE: inputs cannot coincide with outputs
function change_mapping()
--   change_mapping_ALL()
--   change_mapping_SWAP(in_mapping)
--   change_mapping_SWAP(out_mapping)
--   change_mapping_INPUTS()
--   change_mapping_OUTPUTS()
--   change_mapping_flipF()
  zmax = math.random(1,n_in/4)
  for z = 1,zmax do
    change_mapping_SWAP(in_mapping)
  end
end




--[[ This function is executed every time you press the 'execute'
     button ]]


function adaptive_init()
  bn.set_seed_bn(myseed)
--   F,I = bn.create_RBN_bias_nosl(N,0.75)
  F,I = bn.create_3RBN_bias_nosl(N,bias)
  -- overimpose functions with bias 0.0 on output nodes
  for j = 1,8 do
    F[N][j] = math.random(0,1)
    F[N-1][j] = math.random(0,1)
  end
  for i = 1,N do
--     state[i] = math.random(0,1)
    state[i] = 0
  end
  seed = bn.get_seed()
--   print('BN seed: ' .. seed)
--   bn.print_table(F)
--   bn.print_table(I)
  n_in = N_IN
  n_out = N_OUT
  for i = 1,n_in do
    in_mapping[i] = i
  end
  for i = 1,n_out do
    out_mapping[i] = N - i + 1
  end
  best_in_mapping = bn.table_copy(in_mapping)
  best_out_mapping = bn.table_copy(out_mapping)
  best_F = bn.table_copy(F)
  best_I = bn.table_copy(I)
  nsteps = 0
  efv = 0
  old_efv = 0
  best_efv = 0
  vl = 0
  vr = 0
  
--   in_solution = {1, 31, 60, 4, 64, 60, 7, 1, 9, 7, 11, 50, 13, 76, 10, 12, 17, 30, 15, 58, 99, 96, 24, 65} -- n=100,seed=7, 0.9
--   in_solution = {1, 31, 5, 4, 64, 60, 7, 1, 56, 22, 99, 50, 13, 76, 10, 12, 17, 30, 15, 58, 99, 59, 24, 65}
--   for i = 1,n_in do
--     in_mapping[i] = in_solution[i]
--   end
end





function test_init()
  TEST = true
  bn.set_seed_bn(myseed)
  seed = bn.get_seed()
  print('BN seed: ' .. seed)
  F,I = bn.create_RBN_bias(N,0.75)
  for i = 1,N do
    state[i] = math.random(0,1)
  end
--   bn.print_table(F)
--   bn.print_table(I)
  n_in = N_IN
  n_out = N_OUT
  for i = 1,n_out do
    out_mapping[i] = N - i + 1
  end
  best_in_mapping = bn.table_copy(in_mapping)
  best_out_mapping = bn.table_copy(out_mapping)
  best_F = bn.table_copy(F)
  best_I = bn.table_copy(I)
  nsteps = 0
  efv = 0
  old_efv = 0
  best_efv = 0
  vl = 0
  vr = 0
--   in_solution = {1, 2, 56, 4, 5, 52, 7, 8, 9, 10, 11, 12, 82, 21, 50, 57, 17, 18, 19, 20, 21, 88, 23, 24} -- n=100, seed=4
  in_solution = {1, 31, 60, 4, 64, 60, 7, 1, 9, 7, 11, 50, 13, 76, 10, 12, 17, 30, 15, 58, 99, 96, 24, 65} -- n=100,seed=7, 0.9
--     in_solution = {1, 44, 3, 96, 77, 76, 88, 91, 71, 62, 14, 74, 30, 67, 22, 59, 90, 98, 32, 2, 21, 15, 6, 24} -- n=100,seed=15, 0.9
--   in_solution = {247, 184, 3, 4, 195, 6, 7, 185, 9, 264, 290, 132, 245, 46, 255, 92, 255, 18, 42, 123, 266, 50, 23, 24} -- n=300,seed=12
  for i = 1,n_in do
    in_mapping[i] = in_solution[i]
  end
end





function init()
  adaptive_init()
--   test_init()
end

--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()
  if TEST == false then
    nsteps = nsteps + 1
    efv = efv + eval_function()
    if math.fmod(nsteps,CHECK_STEPS) == 0 then
  --     delta = efv - old_efv
      delta = efv - best_efv
      if (delta <= DELTA_THRESHOLD) then
	in_mapping = bn.table_copy(best_in_mapping)
	out_mapping = bn.table_copy(best_out_mapping)
  --       F = bn.table_copy(best_F)
  --       I = bn.table_copy(best_I)
	change_mapping()
      end
      if efv > best_efv then
	best_efv = efv
	best_in_mapping = bn.table_copy(in_mapping)
	best_out_mapping = bn.table_copy(out_mapping)
  --       best_F = bn.table_copy(F)
  --       best_I = bn.table_copy(I)
	log(nsteps .. ' ' .. best_efv)
	bn.print_vector(best_in_mapping)
      end
      old_efv = efv
      efv = 0
    end
  end
  -- set inputs
  for i = 1,24 do
    if robot.proximity[i].value > 0.1 then
      state[in_mapping[i]] = 1
    else
      state[in_mapping[i]] = 0
    end
  end
  
  
  -- update
--   state = bn.update(state,F,I)
  state = bn.update_3RBN(state,F,I)
  
  vl = state[out_mapping[1]]*VMAX
  vr = state[out_mapping[2]]*VMAX
  robot.wheels.set_velocity(vl,vr)
end


--[[ This function is executed every time you press the 'reset'
     button in the GUI. It is supposed to restore the state
     of the controller to whatever it was right after init() was
     called. The state of sensors and actuators is reset
     automatically by ARGoS. ]]
function reset()
   -- put your code here
end



--[[ This function is executed only once, when the robot is removed
     from the simulation ]]
function destroy()
  print('seed ' .. myseed)
  bn.print_vector(best_in_mapping)
  print('')
  bn.print_vector(best_out_mapping)
  print('')
  print('best ' .. best_efv)
end
