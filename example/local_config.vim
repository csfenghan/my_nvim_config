" 基本选项
set tabstop=4
set shiftwidth=4
set encoding=UTF-8
set fileencodings=utf-8,ucs-bom,cp936,gbk,gbk2312
set fileencoding=utf-8

" custom选项
let g:quick_F2 = ""
let g:quick_F3 = ""
let g:quick_F4 = ""
let g:customAutoSave = v:true

" debug选项
let g:vimspector_configurations = {
\  "cpp": {
\    "adapter": "vscode-cpptools",
\    "configuration": {
\      "name": "cpp",
\      "type": "cppdbg",
\      "request": "launch",
\      "program": "${workspaceRoot}/demo",
\      "args": ["./demo"],
\      "cwd": "${workspaceRoot}",
\      "environment": [],
\      "externalConsole": v:false,
\      "stopAtEntry": v:true,
\      "MIMode": "gdb",
\      "logging": {
\        "engineLogging": v:true
\      }
\    }
\  },
\  "python": {
\    "adapter": "debugpy",
\    "configuration": {
\      "request": "launch",
\      "program": "${workspaceRoot}/demo.py",
\      "args":["./demo"],
\      "stopOnEntry": v:true,
\      "cwd": "${workspaceRoot}"
\    }
\  }
\}
 

