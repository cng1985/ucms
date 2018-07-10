  github = new ServiceBuilder().apiKey("0998d17bd1c5b93f6e41")
                .apiSecret("c14b32ab46eb45e4db950cc47982e4a7f314e202")
                .callback("https://www.haoxuer.com/githublogin.htm").scope("user,public_repo")
                .build(GitHubApi.instance());
btn-github
        oschina = new ServiceBuilder().apiKey("csoxhW9NpxfrPMH67W2t").apiSecret("NlUD9WP1XPHLIqt5dBEWptv4N5gdInDM")
                .callback("https://www.haoxuer.com/oschinalogin.htm").responseType("code")
                .build(OschinaApi.instance());

        weibo = new ServiceBuilder().apiKey("2749867679").apiSecret("51f6d015c40a58f4da538626b89d1e1b")
                .callback("https://www.haoxuer.com/weibologin.htm").build(SinaWeiboApi20.instance());