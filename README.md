# podcast-generator

A GitHub action to generate a podcast feed from a YAML file. YAML is much easier to read and write than XML, and this action will convert your YAML file into a valid podcast feed.

# Usage
**Turn on Github Pages**

A GitHub action to generate a podcast feed from a YAML file. YAML is much easier to read and write than XML, and this action will convert your YAML file into a valid podcast feed.

**Create a YAML file**

Create a YAML file in your repository with the following format:
```
title: <Podcast Title>
subtitle: <Podcast Subtitle>
author: <Author Name>
description: <Podcast Description>
link: <GitHub Pages URL>
image: <Artwork Location>
language: <Podcast Language e.g. en-us>
category: <Postcast Category e.g. Technology https://podcasters.apple.com/support/1691-apple-podcasts-categories>
format: <format of files e.g. audio/mpeg>
item:
  - title: <Podcast Episode Title>
    description: <Podcast Episode Description>
    published: <Date Published - e.g. Thu, 12 Jan 2023 18:00:00 GMT>
    file: <Filename e.g. /audio/TFIT01.mp3>
    duration: <duration e.g. 00:00:36>
    length: <length e.g. 576,324 (Get Info on your files)>
  ... Repeat for each episode
```
**Sample Workflow**

You're also going to need your own workflow file. Here's a sample:

```
name: Generate Feed
on: [push]
jobs:
  generate-feed:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@v3
      - name: Run Feed Generator
        uses: planetoftheweb/podcast-feed-generator@main
```
