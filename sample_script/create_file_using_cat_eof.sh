#!/bin/sh

TEST_STRING="test string"

cat << EOF > case1
#!/bin/sh

echo ${TEST_STRING}
echo \${TEST_STRING}

EOF


cat <<'EOF' > case2
#!/bin/sh

echo ${TEST_STRING}
echo \${TEST_STRING}

EOF
