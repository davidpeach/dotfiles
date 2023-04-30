#!/usr/bin/bash

export title="$title$"

string=""
\$for\(tags\)\$
  string="$tags $string"
\$endfor\$

export tags="$tags"
