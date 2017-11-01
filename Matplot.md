### Color
Matplotlib recognizes the following formats to specify a color:

1. an RGB or RGBA tuple of float values in [0, 1] (e.g., (0.1, 0.2, 0.5) or (0.1, 0.2, 0.5, 0.3));
2. a hex RGB or RGBA string (e.g., '#0F0F0F' or '#0F0F0F0F');
3. a string representation of a float value in [0, 1] inclusive for gray level (e.g., '0.5');
4. one of {'b', 'g', 'r', 'c', 'm', 'y', 'k', 'w'};
5. a X11/CSS4 color name;
6. a name from the xkcd color survey; prefixed with 'xkcd:' (e.g., 'xkcd:sky blue');
7. one of {'tab:blue', 'tab:orange', 'tab:green', 'tab:red', 'tab:purple', 'tab:brown', 'tab:pink', 'tab:gray', 'tab:olive', 'tab:cyan'} which are the Tableau Colors from the ‘T10’ categorical palette (which is the default color cycle);
8. a “CN” color spec, i.e. 'C' followed by a single digit, which is an index into the default property cycle (matplotlib.rcParams['axes.prop_cycle']); the indexing occurs at artist creation time and defaults to black if the cycle does not include color.
