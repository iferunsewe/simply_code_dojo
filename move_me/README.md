# Summary

The task is to navigate Herman ze German around Berlin and output his final coordinates and direction.

## Input:

### First input:

First your program must take the input which will be in the following format:

`[X-Coordinate],[Y-Coordinate],[Direction]`

The direction must be: `N` or `S` or `E` or `W` (Starting letters of North, South, West, East)

Example:  `10,20,N` ( x = 10, y = 20, direction = N(North))

### Second input:

The second input consists of series of `R`, `L`, `G` for recht, links and gehen respectively.

For `R` and `L` (recht and links) the direction of Herman ze German must change accordingly.

For `G` Herman ze German must move 1 unit ahead in the direction in which he was facing.

Rules for calculating coordinates:

```
N = Y + 1
E = X + 1
S = Y - 1
W = X - 1
```

## Output:

The final coordinates and the current direction of the user.

Example:
```
Enter initial data:      1,2,N

Enter the instructions:  GRGLG

Output:                  2,4,N
```

The coordinates can be any integer and can be negative.
