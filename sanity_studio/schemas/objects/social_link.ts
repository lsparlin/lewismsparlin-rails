export default {
  name: 'socialLink',
  title: 'Social Link',
  type: 'object',

  fields: [
    {
      name: 'title',
      title: 'Title',
      type: 'string',
      verification: Rule => Rule.required(),
    },
    {
      name: 'url',
      title: 'URL',
      type: 'string',
    },
    {
      name: 'icon',
      title: 'Link Icon',
      type: 'image',
    },
  ],
};
