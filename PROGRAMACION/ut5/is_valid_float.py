float_pattern = re.compile(r"""
        ^[+-]?(
            (\d+(_\d+)*(\.\d*(_\d+)*)?) |
            (\.\d+(_\d+)*)
        )([eE][+-]?\d+(_\d+)*)?$
    """