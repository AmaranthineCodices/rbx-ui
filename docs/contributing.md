# Contributing
Anyone can contribute to rbx-ui on GitHub. Here are some general guidelines for doing so:

* **Open an issue** before opening a PR. This gives you an easy channel to communicate with other contributors about the feature, and gives us the opportunity to let you know if your issue's already been mentioned before.
* Use tabs for indentation.
* If you're adding an element, create and commit an example with it.
* rbx-ui favors simplicity over efficiency. The only exception to this is where optimization is *necessary* to make the component usable. If you must favor efficiency over simplicity, explain why in comments, so it's not simplified later down the line.
    * This doesn't mean you can't be efficient; it means you shouldn't micro-optimize. Don't clutter the code for the sole purpose of making it faster or more memory-efficient.
* Don't open PRs for half-finished features. Finish them, then open a PR.

## Building the Documentation
To build the documentation locally, you'll need [MkDocs](http://www.mkdocs.org/) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/). You can install them easily using the Python package manager `pip`:

```
> pip install mkdocs mkdocs-material
```

Once everything's installed, in a terminal at the root of the project, run `mkdocs serve` to start a local server for the documentation.

!!! note
    This project's MkDocs server runs on **port 8080**, not the default of port 8000, because Rojo's port is also 8000. To access the local documentation server, go to http://localhost:8080.