import { BiCog } from 'react-icons/bi'
import S from "@sanity/desk-tool/structure-builder";

const Structure =
  S.list()
    .title("Content")
    .items([
      S.listItem()
      .title("Settings")
      .child(
        S.list()
        .title("Settings")
        .items([
          S.listItem()
          .title("Site Settings")
          .child(
            S.document()
            .title("Site Settings")
            .id("siteSettings")
            .documentId("siteSettings")
            .schemaType("siteSettings"),
          ).icon(BiCog),
        ])
      ).icon(BiCog),
    ]);

export default Structure;
