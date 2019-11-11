mkdir crayon
cp crayon.v constants.v colors.v parser.v styles.v utils.v ./crayon
v test crayon_test.v
rm -rf ./crayon