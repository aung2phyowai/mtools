mtools
------
mtools: slightly cosier working with Matlab

`mtools` creates and manages folders for your Matlab projects.

- it remembers which host is associated with which PATH
- it adds paths automatically when you launch Matlab in a related project folder, and makes them available in your Workspace as named variables (so you can use e.g. `paths.mydata` in your scripts rather then the whole path string)
- you can move your project to different PCs (or between your parallel Linux/Windows setup) and never add an incorrect path
- it remembers which files you were working on last time in a given project folder, and opens them again when you run Matlab in that folder (but not elsewhere)

To use it:
----------

- add `mtools` to PATH (preferably permanently using the ui dialog)
- create new projects by calling `create('name_of_your_project')`
- this will create a folder with `startup.m`, `startup.mat` and `finish.m` inside it
- you can tweak some options in the beginning of the `startup.m`
