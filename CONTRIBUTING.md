How to contribute
-----------------

Getting Started
---------------

- Make sure you have a [Github account](https://github.com/signup/free)
- If no existing issue exists, [create a Github issue](https://github.com/proviso/proviso-draft/issues/new)
- [Fork the repository!](https://github.com/proviso/proviso-draft/fork)

Making Changes
--------------

- Clone your new fork, and add a feature branch.
  - Example: `git checkout -b 2-my-nifty-feature`
  - Please avoid working directly on `master`.
- Make commits of logical units. (`git add <filename> -p` is your friend!)
- Check for unnecessary whitespace with `git diff --check` before committing.
- Push your feature branch and attach it to the issue you created.
  - [Issue2Pr: Turn your previously-filed issues into pull requests!](http://issue2pr.herokuapp.com/)
  - Advanced users may also use the [`hub` gem](https://github.com/defunkt/hub#readme):
  
            hub pull-request -i 2 -b proviso:master -h myusername:2-my-nifty-feature

Change Acceptance
-----------------

- All contributors will be submitting changes via pull requests from their forks.
  - Please avoid pushing directly to the main repo, especially to `master`.
- Before a pull request is merged, it should get the :+1: from **two** other
  primary contributors (TBD), not including the code contributor themselves.

*If there's any part of this contributing guide that you disagree with,
please submit a pull request to this file, using your new proposed conventi--* `NaN`
