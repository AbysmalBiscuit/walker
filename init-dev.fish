#!/bin/fish

fish_add_path -p (cat $HOME/Library/Application\ Support/Garmin/ConnectIQ/current-sdk.cfg)/bin

function build
  mkdir -p build/release

  if [ $argv[1] = "release" ]
    monkeyc -f monkey.jungle -o build/release/$argv[2]_release.prg -y developer_key -d $argv[2] -r --optimization 3pz
  else
    monkeyc -f monkey.jungle -o build/$argv[1].prg -y developer_key -d $argv[1] --optimization 1
  end
end

function run
  monkeydo build/$argv[1].prg $argv[1].prg
end
