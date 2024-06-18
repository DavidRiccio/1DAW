import re


def extract_vowel_words(text: str) -> list[str]:
    target = r"\b[aeiouáéíóúAEIOUÁÉÍÓÚ]\w*"
    return re.findall(target, text)
