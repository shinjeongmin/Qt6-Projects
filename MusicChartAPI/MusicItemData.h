#ifndef MUSICITEMDATA_H
#define MUSICITEMDATA_H

#include <QObject>
#include <QUrl>

class MusicItemData : public QObject
{
    Q_OBJECT
public:
    explicit MusicItemData(QObject *parent = nullptr);

    QString title() const;
    void setTitle(const QString &newTitle);

    QString singerName() const;
    void setSingerName(const QString &newSingerName);

    QUrl imageSource() const;
    void setImageSource(const QUrl &newImageSource);

private:
    QString m_title;
    QString m_singerName;
    QUrl m_imageSource;
};

#endif // MUSICITEMDATA_H
