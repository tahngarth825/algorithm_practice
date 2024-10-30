
# Instructions
**NOTE** The instructions below assume that you have Ruby installed in your system and that you have configured a place to install gems (should automatically be handled by a ruby version manager if you use one).

Run the following script from the root of the `adhoc` folder:
```sh
bundle install
ruby compute_rate.rb
```

# Random Notes
* We were told to restrict our time to two hours, or else I would have also added specs.
* Logging in a real system would be tiered based on env (dev/staging/prod).
* Mappings could be in a cache instead of in memory.
* Since the script asks us to override the original `slcsp.csv` file, my script creates a backup of the original `slcsp.csv` file into `slcsp/slcsp_original.csv`, but it does not repeat the action if the backup already exists.
* You can run the script with logging enabled by going to the bottom of the file `compute_rate.rb` and setting `logging = false` to `logging = true`
