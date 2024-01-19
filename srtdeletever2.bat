@echo off

REM Write Python script to a file
echo import os > temp_script.py
echo def process_files(directory): >> temp_script.py
echo     for filename in os.listdir(directory): >> temp_script.py
echo         if filename.endswith(".srt"): >> temp_script.py
echo             full_path = os.path.join(directory, filename) >> temp_script.py
echo             last_word = os.path.splitext(filename)[0].split()[-1].strip() >> temp_script.py
echo             comparison_value = last_word.lower() >> temp_script.py
echo             if comparison_value == "english": >> temp_script.py
echo                 print(f"Keeping: {filename}") >> temp_script.py
echo             else: >> temp_script.py
echo                 print(f"Deleting: {filename}") >> temp_script.py
echo                 os.remove(full_path) >> temp_script.py
echo if __name__ == "__main__": >> temp_script.py
echo     current_directory = os.getcwd() >> temp_script.py
echo     process_files(current_directory) >> temp_script.py

REM Run Python script
python temp_script.py

REM Delete the temporary Python script
del temp_script.py

pause
