#!/bin/bash

function combine::static() {
  local platform="$1"
  local outputdir="$2"
  local libname="$3"

  echo $platform
  echo $libname
  pushd $outputdir >/dev/null
  echo `pwd`
#     rm -f $libname.*

    # Find only the libraries we need
    if [ $platform = 'win' ]; then
      local whitelist="boringssl.dll.lib|protobuf_lite.dll.lib|webrtc\.lib|field_trial_default.lib|metrics_default.lib"
    else
      local whitelist="boringssl\.a|protobuf_full\.a|webrtc\.a|field_trial_default\.a|metrics_default\.a"
    fi
    cat .ninja_log | tr '\t' '\n' | grep -E $whitelist | sort -u >$libname.list

    # Combine all objects into one static library
    case $platform in
    win)
      # TODO: Support VS 2017
      "$VS140COMNTOOLS../../VC/bin/lib" /OUT:$libname.lib @$libname.list
      ;;
    *)
      # Combine *.a static libraries
      echo "CREATE $libname.a" >$libname.ar
      while read a; do
        echo "ADDLIB $a" >>$libname.ar
      done <$libname.list
      echo "SAVE" >>$libname.ar
      echo "END" >>$libname.ar
      ar -M < $libname.ar
      ranlib $libname.a
      ;;
    esac
  popd >/dev/null
}

combine::static "linux" "/home/jiben/Documents/GitHub/webrtc-checkout/src/out/Default" "libwebrtc_full"