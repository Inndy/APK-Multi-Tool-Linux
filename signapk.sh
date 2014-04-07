#!/bin/bash

function GetScriptDir () {
	SOURCE="${BASH_SOURCE[0]}"
	while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
		DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
		SOURCE="$(readlink "$SOURCE")"
		[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
	done
	echo "$( cd -P "$( dirname "$SOURCE" )" && pwd )"
}

path=$(GetScriptDir)/other

java -jar $path/signapk.jar -w $path/testkey.x509.pem $path/testkey.pk8 "$1" "$2"
