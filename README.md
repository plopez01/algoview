# algoview
A niche extensible sorting algorithm visualizer.

## How do I run it?
You are gonna need to download [Processing](https://processing.org/).  
Then clone this repo, open ``algoview.pde`` and run it!

## How do I extend it?
To add a new algorithm just create a new class that implements the ``Algorithm`` interface.  
You will get references to an ``ArrayVisualizer`` and ``SqrOsc`` in the ``setup()`` function.  

### Pointers
Use the Pointer class to create a new Pointer and give it a color and default index value.  
You can use pointers to get, set, and swap values in the array.

### ArrayVisualizer API Documentation
The ArrayVisualizer is the main class to help visualize the data on the array and how your algorithm is working with it.  
It generates a series of bars which height depends on the array's element value, and paints the pointers on top.
|                                **Method**                               |         **Returns**         |                                                  **Description**                                                  |
|:-----------------------------------------------------------------------:|:---------------------------:|:-----------------------------------------------------------------------------------------------------------------:|
| ``void withAlgorithm(Algorithm algorithm)``                             | Nothing.                    | Sets algorithm to be visualized.                                                                                  |
| ``int getAtPointer(Pointer pointer)``                                   | Element pointed by pointer. | Gets element pointed by ``pointer`` in the visualized array.                                                      |
| ``int setAtPointer(Pointer pointer, int value, int offset [optional])`` | Element set at pointer.     | Sets element pointed by ``pointer`` to ``value`` with an optional pointer ``offset``.                             |
| ``void addPointer(Pointer pointer)``                                    | Nothing.                    | Adds a ``pointer`` to be visualized on the array visualization.                                                   |
| ``int getArraySize()``                                                  | Visualized array size.      | Gets the visualized array size.                                                                                   |
| ``void swapElements(Pointer a, Pointer b)``                             | Nothing.                    | Swaps the elements at positions pointed by ``a`` and ``b``.                                                       |
| ``void stop()``                                                         | Nothing.                    | Tells the visualizer that the algorithm has ended it's execution. You must call this when your algorithm is done. |

### SqrOsc API
To play sounds while your algorithm is running you must use the ``SqrOsc`` class instance provided in the ``setup()`` function of your ``Algorithm`` implementing class.  
You can find the ``SqrOsc`` documentation on the [Processing Sound lib reference](https://processing.org/reference/libraries/sound/SqrOsc.html).  
You will be mostly interested on calling ``osci.freq(int frequency)`` so set the tone's frequency depending on the value pointed by a pointer for example.

## Contributing
Please take into account that this is a small project I made while taking a course in data structures and algorithms.  
Please feel free to fork this repo, make the changes you consider, and open a pull request.

## License
This project is under the GPLv3 license, please check the [LICENSE](./LICENSE).
