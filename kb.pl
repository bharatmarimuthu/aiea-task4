exercise(bench_press).
exercise(overhead_press).
exercise(dumbbell_flye).
exercise(bicep_curl).
exercise(tricep_dip).
exercise(pull_up).
exercise(push_up).
exercise(air_squat).
exercise(plank).
exercise(barbell_squat).
exercise(romanian_deadlift).
exercise(goblet_squat).
exercise(walking_lunge).

requires_equipment(bench_press, barbell).
requires_equipment(overhead_press, barbell).
requires_equipment(dumbbell_flye, dumbbell).
requires_equipment(bicep_curl, dumbbell).
requires_equipment(tricep_dip, dip_station).
requires_equipment(pull_up, pull_up_bar).
requires_equipment(push_up, bodyweight).
requires_equipment(air_squat, bodyweight).
requires_equipment(plank, bodyweight).
requires_equipment(barbell_squat, barbell).
requires_equipment(romanian_deadlift, barbell).
requires_equipment(goblet_squat, dumbbell).
requires_equipment(walking_lunge, dumbbell).

targets(bench_press, chest).
targets(bench_press, triceps).
targets(bench_press, shoulders).

targets(overhead_press, shoulders).
targets(overhead_press, triceps).

targets(dumbbell_flye, chest).

targets(bicep_curl, biceps).

targets(tricep_dip, triceps).
targets(tricep_dip, chest).

targets(pull_up, back).
targets(pull_up, biceps).

targets(push_up, chest).
targets(push_up, triceps).

targets(air_squat, quadriceps).
targets(air_squat, glutes).

targets(plank, core).

targets(barbell_squat, quadriceps).
targets(barbell_squat, glutes).

targets(romanian_deadlift, hamstrings).
targets(romanian_deadlift, glutes).

targets(goblet_squat, quadriceps).
targets(goblet_squat, glutes).

targets(walking_lunge, quadriceps).
targets(walking_lunge, glutes).

% determine if an exercise is a compound exercise or not
compound_exercise(Exercise) :- targets(Exercise, Muscle1), targets(Exercise, Muscle2), Muscle1 \= Muscle2.

% find an exercise that targets a specific muscle group using specific equipment
muscle_workout(Muscle, Equipment, Exercise) :- targets(Exercise, Muscle), requires_equipment(Exercise, Equipment).

% find what exercises you can do based on the equipment you have
possible_exercises(Exercise, AvailableEquipment) :- requires_equipment(Exercise, Equipment), member(Equipment, AvailableEquipment).