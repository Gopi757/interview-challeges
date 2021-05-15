# A little terraforming challenge

We have some terraform that creates some files. It is built to
create files of name "test-{input name}" with content of "content",
base on a `list(map(string))` input as below.

It is functional, but we have a problem with state changes. When
we change the variable input from: 

```
    default = [{
        name="filename0"
        content="content0"
    },{
        name="filename1"
        content="content1"
    },{
        name="filename2"
        content="content2"
    }]
```

to

```
    default = [{
        name="filename1"
        content="content1"
    },{
        name="filename2"
        content="content2"
    }]
```

The files associated with "filename1" and "filename2" are recreated as
opposed to just deleteing "filename0".

Please see what changes we can make to the `main.tf` to ensure that we
can add and remove entries from input variable `files` without having
them recreated in certain conditions. Taking care to think about and note
impacts or limitations in approach taken.

Changes can be made to any of the given elements in `main.tf`.

_PS. this is a contrived example, but is representative of a real-world problem!_