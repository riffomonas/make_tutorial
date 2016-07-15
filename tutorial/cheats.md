# Make clean

```
clean :
	rm -f data/raw/*txt
	rm -f data/raw/*pdf
	rm -f data/raw/*zip
	rm -f data/*/*.csv
```

# Variables

```
RAW=data/raw
PROCESSED=data/processed
```

# Long list of dependencies

separate lines with a "\"


# Complex functions




# Phony targets
```
.PHONY : clean
clean :
	rm -f data/raw/*txt
	rm -f data/raw/*pdf
	rm -f data/raw/*zip
	rm -f data/processed/*.csv
	rm -f family_report.html
```


# Pattern matching

print-% :
	@echo "$*= $($*)"
