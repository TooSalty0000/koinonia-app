# Assuming "korean.txt" contains the text you provided earlier
# Let's read the lines from "korean.txt" and then process them

# Load the text from the file
folder_path = "/Users/12salty/Documents/Coding/Flutter Projects/koinonia/assets"
file_path = folder_path + "/korean.txt"

with open(file_path, "r", encoding="utf-8") as file:
    lines = file.readlines()

# Parse each line to extract book, chapter, verse, and context
data = []
for line in lines:
    parts = line.strip().split(" ", 1)
    if len(parts) == 2:  # Ensure the line is correctly formatted
        reference, context = parts
        book_chapter, verse = reference.split(":")
        book = book_chapter[:-1]  # Extract book name
        chapter = book_chapter[-1]  # Extract chapter number

        data.append(
            {"Book": book, "Chapter": chapter, "Verse": verse, "Context": context}
        )

# Save to CSV file
csv_file_path = folder_path + "/bible_verses_from_file.csv"
df.to_csv(csv_file_path, index=False)

csv_file_path
