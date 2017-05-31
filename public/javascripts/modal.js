// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    var modal = document.getElementById('modal');
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function showModal(element) {
    var linkId = element.getAttribute('id');
    var partialContent = element.parentElement.getElementsByClassName('champion_info')[0].innerText;
    var fullContent = getChampionModalText(linkId, partialContent);
    var modalText = document.getElementById('modal-text');
    modalText.innerText = fullContent;
    var modal = document.getElementById('modal');
    modal.style.display = "block";
}

function closeModal() {
    var modal = document.getElementById('modal');
    modal.style.display = "none"
}

function getChampionModalText(champion, firstHalfOfText) {
    var secondHalfOfText = '';
    switch(champion) {
    case 'shannonCT':
        secondHalfOfText = ' I met Rachael a couple of years ago at an event at Kingswood Oxford school.  I saw a sign up at my gym that she was having a fundraiser called "Bootcamp for MS" and I immediately got in touch with her, contacted a friend and we signed up to attended her successful fundraiser.  You could imagine my pride for TVR when they created the fundraiser last year, "Cruising for a Cause".  It was yet another success!  After attending last year as an honored guest, I plan to continue to participate each year going forward!  Every year new treatments and breakthroughs are developed to help those of us with MS. It is all contributed to the commitment of teams like Rachael\'s.';
        break;
    case 'elizabethMD':
        secondHalfOfText = ' I\'m not shy about sharing my journey with MS, as I wish to empower others living with this disease. Every hour of every day, someone is diagnosed with MS.  That’s why I ride with TVR, so that I can raise funds to support cutting-edge research, programs, and services for everyone impacted by MS. Ending MS means no one will hear the words "You have MS" ever again.';
        break;
    case 'sharonNY':
        secondHalfOfText = ' She then kindly asked for my name, and if she could put it on her bandana and the paper sign that said “I Ride For”.  This touched my heart, I thanked her, and this is when the great friendship between Rachael and myself began. I learned more about TV, and their participation in other bikeMS events, Climb to the Top and MuckFest, as well as all their fundraising events, like Rachael’s BootCamp for MS and Cruising for a Cause.  How can I not like a team who does so much for people like me who have MS? Thank you for all that you do!';
        break;
    case 'nancyMA':
        secondHalfOfText = ' He promised her he would do everything he could to fight the disease, so he had started Team Velox Rota in 2005.  It was then that I told him I had MS and I have been volunteering at the Cape Cod Getaway for years.  Every year since, I cheer on all the TVR members, you are all AMAZING.   Every year I look forward to being at most of the team events cheering them on.  I am so grateful for Mike, Rachael and all of TVR for their commitment and determination.  It doesn\'t matter if it is rain or shine, you are out there riding for me and everyone that has MS.  I\'m proud to be a TVR member!';
        break;
    default:
        secondHalfOfText = '';
    }
    return firstHalfOfText.concat(secondHalfOfText);
}
