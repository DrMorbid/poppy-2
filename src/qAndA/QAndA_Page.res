open Message.QAndA
open ReactIntl
open Common.Text

module Section = QAndA_Section

@react.component
let default = () => {
  let intl = useIntl()

  <Common.Text
    header
    afterHeader={<Mui.Typography variant=H4>
      {intl->ReactIntl.Intl.formatMessage(subHeader)->React.string}
    </Mui.Typography>}
    body=Element(
      <Mui.Grid container=true sx={Common.Style.paragraphGap->Utils.Style.styleToSx}>
        <Mui.Grid item=true>
          <Mui.Typography variant=H6>
            {intl->ReactIntl.Intl.formatMessage(topInfo)->React.string}
          </Mui.Typography>
        </Mui.Grid>
        <Mui.Grid item=true>
          <Section
            header=question1
            body=Fragments(list{
              {content: list{Text({content: Message(answer1Paragraph1)})}},
              {
                content: list{
                  Text({content: Message(answer1Paragraph2Part1), bold: true, appendSpace: true}),
                  Text({content: Message(answer1Paragraph2Part2)}),
                },
              },
              {content: list{Text({content: Message(answer1Paragraph3)})}},
            })
            key="question-1"
          />
          <Section
            header=question2
            body=Paragraphs(list{{content: Message(answer2Paragraph1)}})
            key="question-2"
          />
          <Section
            header=question3
            body=Paragraphs(list{
              {content: Message(answer3Paragraph1)},
              {content: Message(answer3Paragraph2)},
              {content: Message(answer3Paragraph3)},
            })
            key="question-3"
          />
          <Section
            header=question4
            body=Paragraphs(list{
              {content: Message(answer4Paragraph1)},
              {content: Message(answer4Paragraph2)},
            })
            key="question-4"
          />
          <Section
            header=question5
            body=Paragraphs(list{
              {content: Message(answer5Paragraph1)},
              {content: Message(answer5Paragraph2)},
              {content: Message(answer5Paragraph3)},
              {content: Message(answer5Paragraph4)},
            })
            key="question-5"
          />
          <Section
            header=question6
            body=Paragraphs(list{
              {content: Message(answer6Paragraph1)},
              {content: Message(answer6Paragraph2)},
              {content: Message(answer6Paragraph3)},
              {content: Message(answer6Paragraph4)},
              {content: Message(answer6Paragraph5)},
              {content: Message(answer6Paragraph6)},
              {content: Message(answer6Paragraph7)},
            })
            key="question-6"
          />
          <Section
            header=question7
            body=Fragments(list{
              {
                content: list{
                  Text({content: Message(answer7Paragraph1Part1), appendSpace: true}),
                  Text({content: Message(answer7Paragraph1Part2), bold: true, appendSpace: true}),
                  Text({content: Message(answer7Paragraph1Part3)}),
                },
              },
              {
                content: list{
                  Text({content: Message(answer7Paragraph2Part1), appendSpace: true}),
                  Text({content: Message(answer7Paragraph2Part2), bold: true}),
                },
              },
              {content: list{Text({content: Message(answer7Paragraph3)})}},
            })
            key="question-7"
          />
          <Section
            header=question8
            body=Paragraphs(list{
              {content: Message(answer8Paragraph1)},
              {content: Message(answer8Paragraph2)},
            })
            key="question-8"
          />
          <Section
            header=question9
            body=Paragraphs(list{
              {content: Message(answer9Paragraph1)},
              {content: Message(answer9Paragraph2)},
            })
            key="question-9"
          />
          <Section
            header=question10
            body=Paragraphs(list{
              {content: Message(answer10Paragraph1)},
              {content: Message(answer10Paragraph2)},
              {content: Message(answer10Paragraph3)},
              {content: Message(answer10Paragraph4)},
              {content: Message(answer10Paragraph5)},
            })
            key="question-10"
          />
          <Section
            header=question11
            body=Lists(list{
              {
                title: answer11Paragraph1,
                list: list{
                  {content: Message(answer11Paragraph1No1)},
                  {content: Message(answer11Paragraph1No2)},
                  {content: Message(answer11Paragraph1No3)},
                  {content: Message(answer11Paragraph1No4)},
                },
              },
              {
                title: answer11Paragraph2,
                list: list{
                  {content: Message(answer11Paragraph2Yes1)},
                  {content: Message(answer11Paragraph2Yes2)},
                },
              },
            })
            key="question-11"
          />
          <Section
            header=question12
            body=Fragments(list{
              {
                content: list{
                  Text({content: Message(answer12Paragraph1Part1), appendSpace: true}),
                  Text({content: Message(answer12Paragraph1Part2), bold: true}),
                },
              },
            })
            key="question-12"
          />
          <Section
            header=question13
            body=Paragraphs(list{
              {content: Message(answer13Paragraph1)},
              {content: Message(answer13Paragraph2)},
            })
            key="question-13"
          />
        </Mui.Grid>
      </Mui.Grid>,
    )
  />
}
