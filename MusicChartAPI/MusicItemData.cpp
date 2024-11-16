#include "MusicItemData.h"

MusicItemData::MusicItemData(QObject *parent)
    : QObject{parent}
{

}

QString MusicItemData::title() const
{
    return m_title;
}

void MusicItemData::setTitle(const QString &newTitle)
{
    if(m_title == newTitle){
        return;
    }
    m_title = newTitle;
}

QString MusicItemData::singerName() const
{
    return m_singerName;
}

void MusicItemData::setSingerName(const QString &newSingerName)
{
    if(m_singerName == newSingerName){
        return;
    }
    m_singerName = newSingerName;
}

QUrl MusicItemData::imageSource() const
{
    return m_imageSource;
}

void MusicItemData::setImageSource(const QUrl &newImageSource)
{
    if(m_imageSource == newImageSource){
        return;
    }
    m_imageSource = newImageSource;
}
