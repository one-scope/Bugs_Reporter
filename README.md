# Bugs_Reporter
bugspotsを用いてPRをオープンした際に自動でバグが潜んでいる可能性の高いファイルをリストにします
## Usage
github actionを用います．

`on`を`pull_request`，`on.<event_name>.types`を`opened`にしてください． \
また，Bugs_ReporterがBugを評価するリポジトリを取り込むことは無いので，`actions/checkout`を用いてリポジトリの内容を取り込んでください．

Workflowの例を示します．
```
name: task
on:
  pull_request:
    types: [opened]

jobs:
    <job_id>:
        - name:
          uses: actions/checkout@v3
        - name:
            uses: one-scope/Bugs_Reporter
            with:
                branch: ${{ github.head_ref }}
                depth: '100'
                word: '修正'
                pull_request_url: ${{ github.event.pull_request.html_url }}
                github_token: ${{ secrets.GITHUB_TOKEN }}
```

引数||説明|
----|----|----
branch|必須|どのファイルにバグが潜んでいるか走査するブランチ
depth||走査するコミットログの深さ
word||
pull_request_url|必須|オープンしたPRのURL
github_token|必須|PRにコメントするためのtoken

## 参考
> [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions) \
> [bugspots - Github](https://github.com/igrigorik/bugspots)