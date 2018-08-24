#!/bin/bash

function print_fail()
{
    echo -en ""$RED"FAIL"$RESET"\n"
}

function print_pass()
{
    echo -en ""$GREEN"PASS"$RESET"\n"
}

function check_output()
{
    diff_output
    print_diff $OUTPUT_DIFF
}

function diff_output()
{
    sort "$YOUR_OUTPUT" > "$YOUR_OUTPUT_SORTED"
    sort "$EXPECTED_OUTPUT" > "$EXPECTED_OUTPUT_SORTED"
    diff "$YOUR_OUTPUT_SORTED" "$EXPECTED_OUTPUT_SORTED" > "$OUTPUT_DIFF"
}

function check_error()
{
    diff_error
    print_diff $ERROR_DIFF
}

function diff_error()
{ 
    sort "$YOUR_ERROR" > "$YOUR_ERROR_SORTED"
    sort "$EXPECTED_ERROR" > "$EXPECTED_ERROR_SORTED"
    diff "$YOUR_ERROR_SORTED" "$EXPECTED_ERROR_SORTED" > "$ERROR_DIFF"

}

function print_diff()
{
    if [ "$1" == "$OUTPUT_DIFF" ]; then
	if [ -s "$1" ]; then
	    print_fail
	    echo "The output between your shell and 'sh' differ"
	    cat "$OUTPUT_DIFF"
	else
	    print_pass
	fi
    elif [ "$1" == "$ERROR_DIFF" ]; then
	if [ -s "$1" ]; then
	    print_fail
	    echo "The errors between your shell and 'sh' differ"
	    cat "$ERROR_DIFF"
	else
	    print_pass
	fi
    else
	echo -n "What are you diffing dude?\n"
    fi
}

function clean_up()
{
    > "$YOUR_OUTPUT" && > "$EXPECTED_OUTPUT"
    > "$YOUR_ERROR" && > "$EXPECTED_ERROR"
    > "$YOUR_OUTPUT_SORTED" && > "$EXPECTED_OUTPUT_SORTED"
    > "$YOUR_ERROR_SORTED" && > "$EXPECTED_ERROR_SORTED"
    > "$OUTPUT_DIFF" && > "$ERROR_DIFF"
    rm -f "$HOME"/.simple_shell_history
    rm -f "$LTRACEOUTPUTFILE"
    rm -f checker_tmp_file_*
    rm -f checker_cat_file_*
}

function stop_shell()
{
    if [ $(pidof "$SHELL" | wc -l) -gt 0 ]; then
	killall -9 "$SHELL" > /dev/null 2>&1
    fi
    clean_up
}

function launch_tests()
{
    for dir in $(ls -d "$TESTDIR"/*/)
    do
	for testname in $(ls "$dir" | grep -v "~$")
	do
	    echo "---------------------------------"
	    echo "Test for $dir$testname: "
	    source "$dir$testname"
	    echo "---------------------------------"
	done
    done
}


source config

clean_up
launch_tests
clean_up
