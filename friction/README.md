# Friction

Friction is the resistance to motion of one object moving relative to another. Here we are modeling kinetic friction by setting the coefficient of friction. By default ODE implements friction with a pyramidal model, which relies on the definition of three directions:
- contact force direction
- first friction direction
- second friction direction

For more info on pyramid friction model:
- [ancient ODE documentation](https://www.ode.org/ode-latest-userguide.html#sec_7_3_7) (but still relevant to Gazebo Harmonic + DART)
- [ancient Gazebo-classic tutorial](https://classic.gazebosim.org/tutorials?tut=physics_params) (again, relevant to Harmonic + DART)


The coefficient of friction in version 1.7 of the sdformat is modeled as an ODE parameter with `mu` as the coefficient for the first friction direction and `mu2` as the coefficient for the second friction direction. In case there is no `mu2`, it is assumed to be equal to `mu`. There is an additional parameter, `fdir1`that can specify a specific primary friction direction relative to the link, otherwise it is modeled relative to the world.

## Example code snippet

```xml
<link>
    ...
    <collision name="${name}_collision">
    ...
        <surface>
            <friction>
                <ode>
                    <mu>1</mu>
                    <mu2>1</mu2>
                    <fdir1>1 0 0</fdir1>
                </ode>
            </friction>
        </surface>
    </collision>
</link>
```

## Results
![friction](assets/friction.gif)

Red cubes are the ones I would expect to stay still, green means go. From left to right:

* **Cube1** Default friction.  [sdformat](http://sdformat.org) states that if no friction is set, mu1 and mu2 are set to 1 (high friction). Therefore, this cube shouldn't move.
* **Cube2** `mu=1`, `mu2=0`.  The ramp is pointed down the `X` axis.  Therefore, I expect that with a high mu along that axis, the cube will not move
* **Cube3** `mu=0`, `mu2=1`.  The ramp is pointed down the `X` axis.  Therefore, I expect that with no friction along this direction, the cube will move down the ramp.
* **Cube4** `mu=1`, `mu2=0`, `fdir1=1 0 0` (pointed down the ramp).  Since the mu value is aligned with the ramp, I expect the block to stay still.
* **Cube5** `mu=1`, `mu2=0`, `fdir1=0 1 0` (pointed toward the sides of the ramp).  Since the mu value is perpendicular to the ramp, I expect the block to move.
* **Cube6** `mu=1`, `mu2=0`, `fdir1=0 0 1` (pointed up).  Since the mu value is perpendicular to the ramp, I expect the block to move.
* **Cube7** Cube4, rotated along the Y-axis  Since the mu value is rotated to be perpendicular to the ramp, I expect the block to move.
* **Cube8** `mu=1` rotated along the X-axis.  Since only setting mu should set both values, I expect the result to be rotation agnostic and remain stationary.
* **Cube9** `mu=1` rotated along the X and Y-axis.  Since only setting mu should set both values, I expect the result to be rotation agnostic and remain stationary.

<!-- Notably, neither behaved quite how I was expecting.  In Gazebo, the mu and mu2 arguments acted on the opposite axis as I expected, with the world y frame corresponding to mu and the world x frame corresponding to mu2. In Ignition, the mu and mu2 arguments act on the axis that I expected, with x corresponding to mu and y corresponding to mu2. However, setting the `fdir1` direction to orientations perpendicular to the ramp direction incorrectly makes the box remain stationary on the ramp. -->