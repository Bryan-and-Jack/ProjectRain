import tkinter as tk
from tkinter import ttk, filedialog 
import tkinter.messagebox as messagebox
import json
import os

base_directory = os.path.dirname(os.path.abspath(__file__))

# Needs to be changed later - currently set for testing!
lang_directory = os.path.join(base_directory, "..", "lib", "lang")
lang_directory = os.path.abspath(lang_directory)

# --- Logic ---
def load_arb_file(fileName):
    """Simply loads an ARB file"""
    file_path = lang_directory + "/" + fileName
    if not file_path:
        return
    
    try:
        with open(file_path, "r", encoding="utf-8") as file:
            data = json.load(file)

        cleaned_data = parse_arb(data)
        display_output(cleaned_data)

    except Exception as e:
        text_area.delete("1.0", tk.END)
        text_area.insert(tk.END, f"Error loading file:\n{e}")

def prompt_load_arb_file():
    """Opens a file dialog, reads an ARB file, and processes it."""
    file_path = filedialog.askopenfilename(filetypes=[("ARB Files", "*.arb"), ("All Files", "*.*")])
    if not file_path:
        return
    
    try:
        with open(file_path, "r", encoding="utf-8") as file:
            data = json.load(file)

        cleaned_data = parse_arb(data)
        display_output(cleaned_data)

    except Exception as e:
        text_area.delete("1.0", tk.END)
        text_area.insert(tk.END, f"Error loading file:\n{e}")

def parse_arb(data):
    """Extracts key-value pairs and their metadata descriptions correctly."""
    parsed_data = {}

    for key, value in data.items():
        if not key.startswith("@"):  
            parsed_data[key] = value
        elif key[1:] in parsed_data and isinstance(value, dict) and "description" in value:
            parsed_data[f"{key[1:]}_description"] = value["description"] 

    return parsed_data

def display_output(parsed_data):
    """Displays parsed ARB data with proper spacing between entries."""
    text_area.delete("1.0", tk.END)  
    
    for key, value in parsed_data.items():
        if "_description" in key: 
            text_area.insert(tk.END, f'{key}: "{value}"\n\n')  
        else:
            text_area.insert(tk.END, f'{key}: "{value}"\n')

def format_parsed_to_arb(parsed_data):
    """Converts parsed data back into .arb formatted string."""
    arb_data = {}

    for key, value in parsed_data.items():
        if "_description" in key:
            original_key = key.replace("_description", "")
            arb_data[f"@{original_key}"] = {
                "description": value
            }
        else:
            arb_data[key] = value
    
    arb_str = json.dumps(arb_data, indent=4)
    return arb_str

def save_to_file(fileName, selected_language):
    """Saves the content of the text_area to a file, with the selected language code."""
    file_path = lang_directory + "/" + fileName
    text_data = text_area.get("1.0", tk.END).strip()  
    
    try:
        lines = text_data.split('\n')
        arb_data = {}

        language_code = selected_language.get().split(" - ")[0]

        # Add @@locale to the top of the ARB data
        arb_data["@@locale"] = language_code

        for line in lines:
            line = line.strip()
            if line:
                if ": " in line:
                    key, value = line.split(": ", 1)
                    # If it's a description, add it as @key
                    if "_description" in key:
                        original_key = key.replace("_description", "")
                        if original_key not in arb_data:
                            arb_data[original_key] = {}
                        arb_data[f"@{original_key}"] = {"description": value.strip('"')}
                    else:
                        arb_data[key] = value.strip('"')
        
        arb_str = format_parsed_to_arb(arb_data)

        with open(file_path, "w", encoding="utf-8") as f:
            f.write(arb_str)
        print(f"File saved as {file_path}")
        
    except Exception as e:
        print(f"Error: {e}")

def language_file(selected_language):
    language_code = selected_language.get().split(" - ")[0]
    return "app_" + language_code + ".arb"

def confirm_and_apply():
    if messagebox.askyesno("Confirm", "WARNING: This program is in testing phase - it will override any files when confirmed, even with syntax errors! \n\nAre you sure you want to apply the changes?"):
        save_to_file(language_file(selected_language), selected_language)

# --- UI ---
root = tk.Tk()
root.title("Localization Tool for Project Rain")
root.geometry("800x600")

# Title frame
title_frame = tk.Frame(root)
title_frame.pack(fill="x", pady=5)

# Title
title_label = tk.Label(title_frame, text="Localization Tool for Project Rain", font=("Arial", 14, "bold"))
title_label.pack(side="left", expand=True)

# Version
version_label = tk.Label(title_frame, text="v0.1", font=("Arial", 10), fg="gray")
version_label.pack(side="right", padx=10)

# Language Selector
language_label = tk.Label(root, text="Select Language:", font=("Arial", 10))
language_label.pack(pady=(10, 0))

languages = {
    "en": "English",
    "es": "Español",
}

selected_language = tk.StringVar(value="en - English") 
language_dropdown = ttk.Combobox(root, textvariable=selected_language, values=[f"{k} - {v}" for k, v in languages.items()], state="readonly")
language_dropdown.pack(pady=5)

# Load the select language button
language_button_frame = tk.Frame(root)
language_button_frame.pack(pady=(10, 0))

load_button = tk.Button(language_button_frame, text="Load Selected", width=15, command=lambda: load_arb_file(language_file(selected_language)))
load_button.pack(side="right", padx=10)

# Editor field
text_area = tk.Text(root, height=21, width=80, font=("Arial"))
text_area.pack(pady=10)

# Buttons
button_frame = tk.Frame(root)
button_frame.pack(pady=5)

load_file_button = tk.Button(button_frame, text="Load File", width=10, command=lambda: prompt_load_arb_file())
load_file_button.pack(side="left", padx=10)

apply_button = tk.Button(button_frame, text="Apply", width=10, command=confirm_and_apply)
apply_button.pack(side="right", padx=10)

root.mainloop()
