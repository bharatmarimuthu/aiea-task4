import janus_swi as janus

janus.consult("kb.pl")

print("plank uses bodyweight:", janus.query_once("requires_equipment(plank, bodyweight)")["truth"])

print("plank targets chest:", janus.query_once("targets(plank, chest)")["truth"])

print("bench press is a compound exercise:", janus.query_once("compound_exercise(bench_press)")["truth"])

print("bicep curl is a compound exercise:", janus.query_once("compound_exercise(bicep_curl)")["truth"])

print("targets glutes:")
for ans in janus.query("targets(X, glutes)"):
    print("  ", ans["X"])

print("exercise that targets chest using dumbbells:")
for ans in janus.query("muscle_workout(chest, dumbbell, X)"):
    print("  ", ans["X"])

print("possible exercises with dumbbells and bodyweight:")
for ans in janus.query("possible_exercises(X, [dumbbell, bodyweight])"):
    print("  ", ans["X"])

print("compound:", janus.query_once("setof(_X, compound_exercise(_X), L)")["L"])

print("bench press proofs:", len(list(janus.query("compound_exercise(bench_press)"))))