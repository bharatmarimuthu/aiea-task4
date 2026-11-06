# Exercise Knowledge Base (Prolog + Janus)

A small Prolog knowledge base that models gym exercises, the equipment each one requires, and the muscle groups it targets, queried both in SWI-Prolog and from Python using Janus.

## Files

| File | Description |
|---|---|
| `kb.pl` | The knowledge base: 13 exercises, their equipment, the muscles they target, and 3 rules |
| `run_queries.py` | Python script that loads `kb.pl` with Janus and runs the same queries as the Prolog session |
| `prolog_output.txt` | Output of the queries run directly in SWI-Prolog |
| `python_output.txt` | Output of `run_queries.py` |

## How to run

**Prolog** (requires [SWI-Prolog](https://www.swi-prolog.org/)):

```bash
swipl kb.pl
```

Then enter queries at the `?-` prompt, for example `targets(X, glutes).`

**Python** (requires SWI-Prolog to be installed first):

```bash
pip install janus-swi
python run_queries.py
```

Tested with SWI-Prolog 10.0.2, janus-swi 1.5.3, and Python 3.14.

## Rules

- `compound_exercise(Exercise)`: true if the exercise targets at least two different muscle groups.
- `muscle_workout(Muscle, Equipment, Exercise)`: finds exercises that target a given muscle using a given piece of equipment.
- `possible_exercises(Exercise, AvailableEquipment)`: finds exercises you can do with a list of available equipment.

## Queries and results

| Query | Result |
|---|---|
| `requires_equipment(plank, bodyweight)` | true |
| `targets(plank, chest)` | false |
| `targets(X, glutes)` | air_squat, barbell_squat, romanian_deadlift, goblet_squat, walking_lunge |
| `compound_exercise(bench_press)` | true (6 proofs) |
| `compound_exercise(bicep_curl)` | false |
| `muscle_workout(chest, dumbbell, X)` | dumbbell_flye |
| `possible_exercises(X, [dumbbell, bodyweight])` | dumbbell_flye, bicep_curl, push_up, air_squat, plank, goblet_squat, walking_lunge |
| `setof(X, compound_exercise(X), L)` | 10 compound exercises (see output files) |

The Python output matched the Prolog output for all 8 queries.

## Notes

- `compound_exercise(bench_press)` succeeds 6 times in Prolog because bench press targets 3 muscles and the rule checks every ordered pair of different muscles (3 × 2 = 6). `setof` removes these duplicates.
- In Python, the `setof` query had to use `_X` instead of `X` (`setof(_X, compound_exercise(_X), L)`). Janus tries to return every named variable in a query, and `X` is never bound outside `setof`, which caused an "Arguments are not sufficiently instantiated" error. Variables starting with an underscore are not returned, so the query works.
