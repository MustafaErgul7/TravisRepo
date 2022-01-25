VERSION="7.4.27"

if [[ ! $VERSION =~ ^master$ ]] && [[ "$(printf "7.4\n$VERSION" | sort -V | head -n1)" < "7.4" ]]; then
    echo "werwerwer"
else
    echo "thi"
    echo $VERSION
fi
