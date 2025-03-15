if [ $# -lt 2 ]; then
	echo "error: Missing Argument"
	exit 1
fi

writefile=$1
writestr=$2

mkdir -p "$(dirname $writefile)"
echo "${writestr}" > "${writefile}"

if [ $? -ne 0 ]; then
	echo "Error: File creation unsuccessful"
	exit 1
fi

echo "File "${writefile}" creation successful with content: ${writestr}"
