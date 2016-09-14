mtools
------

Managing data-analysis projects in dedicated folders is a bit of a pain, but `mtools` make it slightly easier. If you launch Matlab in a given project folder with `mtools` in PATH, it will:

- reopen the files you were working on last time *in that folder* (and not elsewhere, as is the default)
- add previously added paths and make them available in your Workspace as variables
- keep track of which host you are working on, so you can move your project between different PCs (or parallel Linux/Windows setup) and never add incorrect paths

To use it:
----------

- add `mtools` to PATH (preferably permanently using the ui dialog)
- create new projects by calling `create('name_of_your_project')`
- this will create a folder with `startup.m`, `startup.mat` and `finish.m` inside it
- add new paths and give them informative names by calling the `add_paths` function
- tweak some options in the beginning of the `startup.m`
