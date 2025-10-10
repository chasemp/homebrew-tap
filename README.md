# chasemp Homebrew Tap

This repository contains Homebrew formulas for tools developed by chasemp.

## Available Formulas

### mdsync

A powerful tool for syncing between Google Docs, Confluence, and Markdown files.

**Installation:**
```bash
brew install chasemp/tap/mdsync
```

**Features:**
- **Bidirectional Sync**: Sync between Google Docs, Confluence, and Markdown files
- **Batch Document Management**: Combine multiple markdown files into single documents
- **Table of Contents**: Generate working TOC with clickable links in Google Docs
- **Sync Date Tracking**: Automatic timestamps for created/modified dates in frontmatter
- **Smart Detection**: Intelligent destination detection from frontmatter metadata
- **Live Status**: Check frozen/locked status of documents
- **Confluence Macros**: Support for note/info/warning/tip macros
- **Command Line**: Simple, powerful CLI interface

**Usage:**
```bash
# Create a new Google Doc
mdsync document.md --create

# Sync to existing Google Doc
mdsync document.md https://docs.google.com/document/d/DOC_ID/edit

# Create a batch document
mdsync --batch file1.md file2.md --batch-title "My Batch" --batch-toc

# List all documents
mdsync --list .
```

For more information, visit the [mdsync repository](https://github.com/chasemp/mdsync).

## Adding New Formulas

To add a new formula to this tap:

1. Create a new `.rb` file in the `Formula/` directory
2. Follow the Homebrew formula conventions
3. Test the formula locally with `brew install --build-from-source ./Formula/formula-name.rb`
4. Commit and push your changes

## License

This tap is licensed under the Apache License 2.0.