#! /bin/bash

localeIWant="en_US.utf8 fr_CH.utf8"

localeInSystem=$( locale -a )
needToGenerateLocale=false

for interestingLocale in $localeIWant ; do
  localeFound=false
  echo "looking for $interestingLocale"

  # looking if our locale is not already available
  for availableLocale in $localeInSystem ; do
    if [ "$availableLocale" = "$interestingLocale" ]; then
      echo "interestingLocale is available"
      localeFound=true
      break
    fi
  done

  # add our locale to /etc/locale.gen if it is not available
  if [ "$localeFound" = false ]; then
    echo "$interestingLocale need to be generate"
    echo "$interestingLocale" >> /etc/locale.gen
    needToGenerateLocale=true
  fi
done

# generate new locale
if [ "$needToGenerateLocale" = true ]; then
  echo "generate locale"
  locale-gen
fi

