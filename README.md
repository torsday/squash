squash
======

I store all my notes in simple text files, and those files in a Dropbox directory. This has the benefit of not being tied to a single app, small memory footprint, and redundant backup with a version control system, git in my case.

I created __squash__ to merge files of similar content into single ones, in the interest of keeping the number of files in check, and the content tight.

## INSTALLATION

1. [Clone the repo](https://github.com/torsday/squash) wherever you like
1. Append the repo directory to your path, making sure `squash` has executable permissions
1. done

## USE

Within a directory with many `.md` files run

``` bash
$ squash term1 term2 term3

```

This will collect files with the arguments, deleting them, but not before combinging them in a single file titled after the first term. Within the file itself, it uses that same first term as the ```H1``` header, creates an index of all _squashed_ files, and adds an additional ```#``` onto any header declarations, downgrading their header status.


## EXAMPLE

### directory

``` bash
% ls | grep -i regular
Regular Expression - Date.md
Regular Expression - Email Address.md
Regular Expression - Phone Number.md
Regular Expression - Web Address.md
Regular Expression - Zip Code.md
Regular System Updates..md

```

### the command

``` bash
$ squash "Regular Expression" regex
files to squash
  Regular Expression - Date.md
  Regular Expression - Email Address.md
  Regular Expression - Phone Number.md
  Regular Expression - Web Address.md
  Regular Expression - Zip Code.md
--------------------------------
New File: Regular Expression 2015-02-18 20:32:47.md

```

### the result: ```Regular Expression 2015-02-18 20:32:47.md```

---

# Regular Expression

---
## ARCHIVE INDEX
* Regular Expression - Date.md
* Regular Expression - Email Address.md
* Regular Expression - Phone Number.md
* Regular Expression - Web Address.md
* Regular Expression - Zip Code.md

---


---
### ```Regular Expression - Date.md```

```
([01]?\d)[-\/ .]([0123]?\d)[-\/ .](\d{4})
```

---
### ```Regular Expression - Email Address.md```

```
[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}
```

---
### ```Regular Expression - Phone Number.md```

```
\(?(\d{3})\)?[ -.](\d{3})[ -.](\d{4})
```

---
### ```Regular Expression - Web Address.md```

```
((\bhttps?:\/\/)|(\bwww\.))\S*
```

---
### ```Regular Expression - Zip Code.md```

```
 \d{5}(-\d{4})?
```

</code>
