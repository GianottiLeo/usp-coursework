# Escape the House: Interactive Fiction Game in Python

A text adventure in the style of *Zork*, played in the terminal. You wake up locked inside your house and have to find the six pieces of a key your father invented, the special glue to assemble it, and the instruction manual, then reach the front door.

Built for **SME0827 Data Structures** at the Universidade de São Paulo, with the house modeled as a **graph of rooms**. The game is in Portuguese.

![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)

## Play

```bash
python main.py
```

No dependencies, standard library only. At each step you choose a room to move to or an object to inspect by number, and answer `s`/`n` (yes/no) to pick items up.

## Design

```mermaid
flowchart LR
    Q[Bedroom] <--> S[Living room]
    S <--> E[Office]
    E <--> P[Main room]
    P <--> D[Front door]
```

| Structure | Role |
|---|---|
| `TreeNode` | A room: name, description, its objects and the rooms connected to it (`add_child` called in both directions for two-way doors) |
| `Object` | An item with a description and a code (`1`–`6` for key pieces, other codes for the glue, manual, car key and sweater, `-1` for non-collectable items) |
| `Tree.traverse()` | The game loop: tells the room's story, lists exits and objects, validates input and checks the win condition |
| `bag` / `chaves` | Inventory, with key pieces tracked separately |
| `end_game()` | Win check: all six key pieces, the glue and the manual, while standing at the door |

**Rooms and items:** bedroom (2 key pieces), living room (3 key pieces and a mousetrap), office (glue, 6th key piece, computer), main room (manual, sweater, car key) and the front door.

## What I learned

- Modeling a problem as a graph made abstract node-and-edge ideas concrete: rooms are vertices, doors are edges, and the game is a traversal.
- Handling free user input with validation and clear error messages.
- Collaborating on one codebase as a team of four.

## Team

Group project with Beatriz Proença Carvalho, Caio Henrique Mendes Schiavo and Filipe Vasconcelos Ferreira.
