vfsFileSystem('.') |> to => fs

#each f in fs.findFiles('linq*.txt')
    `copy ${f.Name} ${f.Name.lastLeftPart('.')}.sc` |> sh
    `copy ${f.Name} ${f.Name.lastLeftPart('.')}.l`  |> sh
    `move ${f.Name} ${f.Name.lastLeftPart('.')}.ss` |> sh
/each
