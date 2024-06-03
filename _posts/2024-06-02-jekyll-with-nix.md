---
layout: post
title:  "Jekyll with Nix"
date:   2024-06-02
categories:
---

<!-- output -->
<img src="/assets/gazing.jpg" alt='Image of a swirling, purple-yellow galaxy shining on two planets.' class="responsive-img">


I want to publicly discuss my process in setting up my GitHub pages site. Nothing I say here will provide even one tenth of the insight you can get by reading documentation. So do not think this is a guide. It's more of a journal. Plus this shit is easy to set up anyway.

## Jekyll
[Jekyll](https://jekyllrb.com/) is a static-site generator built in Ruby with great support for GitHub Pages. I have never touched Ruby before - so no familiarity with the ecosystem or how projects are typically structured.

## bundix
Nix is generally intolerant of ignorance. So I learnt the basics of Gems, generated my Gemfile.lock with bundler, and finally gemset.nix with [bundix](https://github.com/nix-community/bundix).

bundix does not work well with pre-built, platform-specific gems - which is clearly stated in the nixpkgs documentation. I managed to skip over this subsection like an animal. Instead, I found the corresponding [pull request](https://github.com/nix-community/bundix/pull/68) after an undisclosed amount of time.

The gem version recorded in gemset.nix corresponds to whichever platform was recorded in Gemfile.lock. For some reason I do not understand, platform-dependent gems fetch gems for differing platforms. This causes hash mismatches when building the shell. The PR has been open since 2019 ¯\\_(ツ)_/¯. Issue is easily resolved by changing bundler's config to use platform-independent gems only.

## Theme
The worst part of setting up a site is actually designing it. I wanted a very simple page, no bullshit. Found this console-based [theme](https://github.com/b2a3e8/jekyll-theme-console) and tweaked the styling a bit. Cannot be bothered to do more.

## Ok
Overall, the entire setup maybe took 2-3 hours. Not really worth writing all this shit afterwards.

Ok, so I am bad at writing which is clearly undesirable. How lucky must I be that everything is a learnable skill that can be practiced. This page is just a tool to exercise writing posts. Maybe further into my research program, I can actually post something marginally interesting.
