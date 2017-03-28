# README

This is a repository that is used in a tutorial on how to use [GNU Make](https://www.gnu.org/software/make/). The [tutorial](http://www.riffomonas.org/tutorials/make/#1) is part of my Reproducible Research in Microbial Informatics series. If you aren't interested in the motivation from a microbiology perspective, you can skip ahead to around [slide 15](http://www.riffomonas.org/tutorials/make/#15). The tutorial focuses on replicating an analysis performed by FiveThirtyEight to [predict someone's age using their name](http://fivethirtyeight.com/features/how-to-tell-someones-age-when-all-you-know-is-her-name/).

If it isn't obvious, a significant limtation of using `make` to make your analysis more reproducible is that it only runs on Mac OS X and Linux. If you have a computer running windows, you'll need to install the [Linux Bash window in Windows 10](https://www.google.com/search?rls=en&q=bash+on+windows&ie=UTF-8&oe=UTF-8) (I'm not sure if it runs on Cygwin)


# Datasets

The analysis draws names from two sources within the Social Security Administration:
* [Life tables](http://www.ssa.gov/oact/NOTES/as120/LifeTables_Tbl_7.html)
* [Name frequency](https://www.ssa.gov/oact/babynames/limits.html)


## Dependencies
* `make`, `curl`, and `unzip`
* `R` and the package `zoo` (`zoo` will be installed if it isn't already)
