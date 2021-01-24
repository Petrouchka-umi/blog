module ApplicationHelper
  def default_meta_tags
    {
      site: 'Umi-blog',
      reverse: true,
      separator: '|',
      description: "description",
      keywords:    "Ruby,Rails,blog,umi",
      noindex: ! Rails.env.production?,
      charset: "UTF-8",
      og: defalut_og,
      twitter: default_twitter_card
    }
  end
  
  private
  
  def defalut_og
    {
      title: :full_title,          # :full_title とすると、サイトに表示される <title> と全く同じものを表示できる
      description: :description,
      url: request.url,
      image: 'https://example.com/hoge.png'
      # image: asset_path("")
    }
  end
  
  def default_twitter_card
    {
      card: 'summary_large_image',
      site: '@qhnxt6umi'
    }
  end
end
