export default {
  name: 'siteSettings',
  title: 'Site Settings',
  type: 'document',
  fieldsets: [
    {
      name: 'seo',
      title: 'SEO',
      options: {
        collapsible: true,
        collapsed: true,
      },
    },
  ],

  fields: [
    {
      name: 'title',
      title: 'Title',
      type: 'string',
      verification: Rule => Rule.required(),
    },
    {
      name: 'subtitle',
      title: 'Subtitle',
      type: 'string',
    },
    {
      name: 'bio',
      title: 'Bio',
      type: 'text',
      options: {
        rows: 3,
      },
    },

    {
      name: 'keywords',
      title: 'Keywords',
      type: 'string',
      description: 'Keywords for SEO',
      fieldset: 'seo',
    },
    {
      name: 'description',
      title: 'Description',
      type: 'text',
      description: 'Description for SEO',
      fieldset: 'seo',
    },
    {
      name: 'twitter_account',
      title: 'Twitter Account',
      type: 'string',
      description: 'Twitter Account for SEO',
      fieldset: 'seo',
    },
    {
      name: 'og_image',
      title: 'Open Graph Image',
      type: 'image',
      description: 'Image for SEO',
      fieldset: 'seo',
    },
  ],
};
