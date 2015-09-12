# Event Matching #

## Question ##

Write code that accepts Events (essentially JSON objects), and returns a set
of Patterns that the Event satisfies.

Patterns contain a set of Rules, and a Pattern is considered satisfied if all
of its Rules are satisfied.

A Rule is some arbitrary expression about an Event, eg. has 5 fields or
contains a timestamp.

You can imagine that there would be dozens of Rules and hundreds or thousands
of Patterns based on them.

## Solution ##

Doing this efficiently comes down to bit twiddling.

Running:

    crystal spec
