class XML {

    _xmlStr = null;

    constructor(xmlStr) {
        _xmlStr = xmlStr;
    }

    // Finds the value inside the tag at the specified path
    //
    // Parameters:
    //     path              array representing the path to the tag
    // Return: the value inside the tag
    function find(path) {
        local v = split(path[0], "][");
        local tag = v[0];
        local openTagRegex = regexp2(@"<" + tag + "" + "[^>]*>");
        local closeTagRegex = regexp2(@"</" + tag + ">");
        local openTag;
        local closeTag;

        if (v.len() > 1) {
            local index = v[1].tointeger();

            local startOffset = 0;

            for (local i = 0; i < index; i++) {
                openTag = openTagRegex.search(_xmlStr, startOffset);
                closeTag = closeTagRegex.search(_xmlStr, startOffset);
                startOffset = closeTag.end;
            }
        } else {
            openTag = openTagRegex.search(_xmlStr);
            closeTag = closeTagRegex.search(_xmlStr);
        }

        if (path.len() > 1) {
            local subXml = XML(_xmlStr.slice(openTag.end, closeTag.begin));
            return subXml.find(path.slice(1));
        } else {
            local content = _xmlStr.slice(openTag.end, closeTag.begin);
            return content;
        }
    }

    // Counts the number of tags with a specific name at the specified path
    //
    // Parameters:
    //     path              array representing the path to the tag
    // Return: the number of tags with the specified name
    function count(path) {
    }

    function getValue() {
        return _xmlStr;
    }

}
