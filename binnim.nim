#!/usr/bin/env nimr

import os
import streams
import strutils

proc binnim(filenames: seq[string], width: int = 20, quotes: bool = true) =
    try:
        if filenames.len == 0:
            raise new_exception(Exception, "You must supply a filename.")

        for filename in filenames:
            if not os.file_exists(filename):
                stderr.write_line(filename & " is not found." & "\n")
                continue

            var file_stream = streams.new_file_stream(filename, fmRead)
            var counter = 0
            while not file_stream.at_end():
                if counter == 0:
                    if quotes:
                        stdout.write "\""

                var character = file_stream.read_str(1)
                stdout.write "\\x" & strutils.to_lower(strutils.to_hex(character))
                counter += 1

                if width != 0:
                    if counter >= width:
                        if quotes:
                            stdout.write "\""
                        stdout.write "\n"
                        counter = 0

            file_stream.close()

            if quotes:
                stdout.write "\""

    except:
        stderr.write_line("[ERROR] " & get_current_exception_msg() & "\n")

when is_main_module:
    import cligen; dispatch(binnim)
