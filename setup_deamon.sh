./clean.pl
./compile.pl -DskipTests
./assemble.pl -p dir -DskipTests
export ONMS_RELEASE=$(./.circleci/scripts/pom2version.sh pom.xml)
echo "RUNAS=$(id -u -n)" > "target/opennms-${ONMS_RELEASE}/etc/opennms.conf"
./target/opennms-"${ONMS_RELEASE}"/bin/runjava -s
./target/opennms-"${ONMS_RELEASE}"/bin/install -dis
./target/opennms-"${ONMS_RELEASE}"/bin/opennms -vf start