import os
import re
from datetime import datetime

def fix_date_in_file(filepath):
    """Fix the date field in a markdown file"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Replace the R date syntax with a proper Hugo date
        # Pattern: date: "`r Sys.Date()`"
        pattern = r'date:\s*["\']?`r Sys\.Date\(\)`["\']?'
        current_date = datetime.now().strftime('%Y-%m-%d')
        
        if re.search(pattern, content):
            new_content = re.sub(pattern, f'date: {current_date}', content)
            
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(new_content)
            
            print(f"✓ Fixed: {filepath}")
            return True
        return False
    except Exception as e:
        print(f"✗ Error fixing {filepath}: {e}")
        return False

def main():
    # Root content directory
    content_dir = r'e:\fcj-workshop-template-main\fcj-workshop-template-main\content'
    
    fixed_count = 0
    total_files = 0
    
    # Walk through all directories
    for root, dirs, files in os.walk(content_dir):
        for file in files:
            if file.endswith('.md'):
                filepath = os.path.join(root, file)
                total_files += 1
                if fix_date_in_file(filepath):
                    fixed_count += 1
    
    print(f"\n{'='*50}")
    print(f"Total files checked: {total_files}")
    print(f"Files fixed: {fixed_count}")
    print(f"{'='*50}")

if __name__ == '__main__':
    main()
