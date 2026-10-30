#!/bin/sh
if [ "$GITHUB_ACTIONS" != "true" ]; then
  cat *md guides/*md slides/*md handouts/*md | generate_references
fi

