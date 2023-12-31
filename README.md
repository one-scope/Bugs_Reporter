# Bugs_Reporter
bugspotsを用いてPRをオープンした際に自動でバグが潜んでいる可能性の高いファイルをリストにします
## Usage
github actionを用います．

- `jobs.<job_id>.pull-requests.pull-requests`を`write`にしてください．
- Bugs_ReporterがBugを評価するリポジトリを取り込むことは無いので，`actions/checkout`を用いてリポジトリの内容を取り込んでください．

Workflowの例を示します．
```
name: task
on:
  pull_request:
    types: [opened]

jobs:
    <job_id>:
      runs-on: <os>
      permissions:
        pull-requests: write
      steps:
        - name:
          uses: actions/checkout@v3
        - name:
          uses: one-scope/Bugs_Reporter@v1
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
word||スコアリングする単語
pull_request_url|必須|オープンしたPRのURL
github_token|必須|PRにコメントするためのtoken

## 参考
> [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions) \
> [bugspots - Github](https://github.com/igrigorik/bugspots)